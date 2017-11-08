class Csvapi < ApplicationRecord
  require 'csv'
  require 'rest-client'

  def self.import(file, export, site, credentials, object, fieldname, fieldto)
    CSV.foreach(file.path, headers: true) do |row|

      product_hash = row.to_hash 
      product = Csvapi.where(id: product_hash["id"])

      if product.count == 1
        product.first.update_attributes(product_hash)
      else
        #Inserting the data
        Csvapi.create!(product_hash)

        #Constructing API URL

        Csvapi.last.update(object: object)

        if Csvapi.last.object == "1"
          siteendpoint = "/api/invoices/" + Csvapi.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<invoice-header>"
          messageend = "</invoice-header>"
        elsif Csvapi.last.object == "2"
          siteendpoint = "/api/purchase_orders/" + Csvapi.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<order-header>"
          messageend = "</order-header>"
        elsif Csvapi.last.object == "3"
          siteendpoint = "/api/expense_reports/" + Csvapi.last.recordid.to_s + "?return_object=limited"
          messagebegin = "<expense-header>"
          messageend = "</expense-header>"
        else
          puts "No Object Sent"
        end

        Csvapi.last.update(site: site)

        constructedurl = Csvapi.last.site + siteendpoint

        #Headers construction using credentials
        headerpass = credentials
        headeraccept = "application/xml"

        #If a field is changing then add more to the mesaging.
        if Csvapi.last.fieldname.length > 2 && Csvapi.last.fieldto.length > 2
          fieldpayload = "<" + Csvapi.last.fieldname + ">" + Csvapi.last.fieldto + "</" + Csvapi.last.fieldname + ">"
        else
          fieldpayload = ""
        end

        #Exporting and sending the desired payload
        Csvapi.last.update(export: export)
        if Csvapi.last.export == "0"
          RestClient.put(constructedurl, messagebegin+"<exported>false</exported>"+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        elsif Csvapi.last.export == "1"
          RestClient.put(constructedurl, messagebegin+"<exported>true</exported>"+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        elsif fieldpayload != ""
          RestClient.put(constructedurl, messagebegin+fieldpayload+messageend, {:X_COUPA_API_KEY => headerpass, :Accept => headeraccept} )
        else
          puts "No exported flag sent or payload" + Csvapi.last.export
        end
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file, export)
end # end class
