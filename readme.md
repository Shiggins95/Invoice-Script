# Invoice Generator

### How to use
- Open `Freelance Hours` Google Sheet
- Copy and paste the hours you want to bill for into the `Export` tab/sheet
- Go to File => Download => Tab Separated Values (.tsv)
- Downlaod the file into this repo's data folder (create it at root if needed), replacing data.tsv (if exists)
- Run `npm run start`
- The generated invoice will be in the `ouput` folder

### Additional notes
Before running your folder structure should look like:

````
- |
    - data |
        - data.tsv
        
    - output |
        <empty>
        
    - src |
        <scripts>
        
    - templates |
        - invoice.ftl
````
