# Warehouses & Inventory
**— an application to track inventory in a set of warehouses**

:warning:  Project status: ongoing   

### Features
- [x] Register, edit and delete a warehouse  
- [x] See a list of all warehouses, and access their details  
- [ ] Register, edit and delete products  
- [ ] See a list of all products, and access their details  
- [ ] See a list of all warehouses in which a product is available  
- [ ] See a list of all products available in a warehouse  
- [ ] Track how many items of each product are available in the whole system  

### Installation

![This app requires Ruby v.3.1.1 to be installed](https://img.shields.io/static/v1?label=rubyonrails&message=version%203.1.1&color=B61D1D&style=for-the-badge&logo=rubyonrails)

1 - Clone the repository  
`$ git clone git@github.com:kyriri/treinadev8-1warehouse.git`

2 - Change to the project directory   
`$ cd treinadev8-1warehouse`

3 - Install the gems / dependencies   
`$ bin/setup`

### Running the application

To start the application, from the project directory:  
`$ rails server`  
The app will become available at the web address http://localhost:3000/ and can be accessed from any browser.  
  
To stop the application, go back to the Command Prompt (Windows) or Terminal (Linux, Mac) and press control + C, or ^ + C for Mac users.

### Database 

For demonstration purposes, the app comes with some warehouses already registered on the database. They can be deleted individually through a button on their detail pages, or by running the command below on the app directory:   
`$ rails db:reset`   
(please note this will clean all data, not only the pre-loaded items)

### Test suit

On the app directory, run   
`$ rspec`   
  
### Other info
App developed in the context of the [Treinadev](https://treinadev.com.br/) bootcamp
