# README

* Database creation
  - Install https://rvm.io/  and ensure that you have ruby on rails installed locally
  - Bundle gem install
  - rake db:setup

* How to Use
This should be used as an example on how to automate rest calls and currently works with 3 object Invoices, Orders, and Expenses.

  - You need to supply a file with the following headers
 | recordid | fieldname | fieldto |

  - The recordid will be the id of the records you intend to update_attributes and this field is required.
      ```sh
      Note: fieldname and fieldto are not required
      fieldname and fieldto are used to identify a field on the header and change the value
      ```
  - Select an object, Invoices, Orders, expense_reports
  - Chose if you would like to toggle the exported flag.
  - Insert the Site URL
  - Insert an API key that has access to make the changes you would like to the object
  - Import CSV


* Usage File Examples

Just IDs to toggle the exported flag (file text below):

```sh
recordid
302
278
278
```

Multiple changes to a single record and changes to Header values(file text below):
```sh
recordid,fieldname,fieldto
302,description,Populate this
278,description,Test10
278,approval-level,Level 2
```
