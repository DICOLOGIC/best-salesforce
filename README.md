# best-salesforce by DICOLOGIC®
A repository of best practices, principles and standards that help us deliver great value to our Salesforce customers


## GIT & CLI

### Package-oriented architecture


Retrieves metadata from a package.xml and saves it in a specific subfolder
```
sf project retrieve start -o MyTP  -x .\PackageXMLProject\package.xml -r .\PackageXMLProject\
```

Deploys metadata from a specific package.xml in the subfolder
```
sf project deploy start -a 58.0 --source-dir .\PackageXMLProject\
```
