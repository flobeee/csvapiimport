# README

* Database creation
1.) Install https://rvm.io/  and ensure that you have ruby on rails installed locally
2.) Bundle gem install
3.) rake db:setup

* How to Use
This should be used as an example on how to automate rest calls and currently works with 3 object Invoices, Orders, and Expenses.

1.) You need to supply a file with the following headers recordid,	fieldname, and fieldto
2.) The recordid will be the id of the records you intend to update_attributes and this field is required
Note: fieldname and fieldto are not required
      fieldname and fieldto are used to identify a field on the header and change the value
3.) Select an object, Invoices, Orders, expense_reports
4.) Chose if you would like to toggle the exported flag.
5.) Insert the Site URL
6.) Insert an API key that has access to make the changes you would like to the object
7.) Import CSV


* Usage File Examples

Just IDs to toggle the exported flag (file text below):
recordid
302
278
278


Multiple changes to a single record and changes to Header values(file text below):
recordid,fieldname,fieldto
302,description,Populate this in the field again
278,description,Test10
278,approval-level,Level 2
