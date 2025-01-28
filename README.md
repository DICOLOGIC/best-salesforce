# best-salesforce by DICOLOGIC®
A repository of best practices, principles and standards that help us deliver great value to our Salesforce customers


## GIT & CLI

### Package-oriented architecture
Divide & conquer the org architecture into functional pieces. Remember: Concept & planning is 80% of the work, so invest some good amount of thoughts into cutting the functionality along processes and/or organizational units, before creating the package structure.

#### Retrieve metadata from a package.xml and saves it in a specific subfolder
```
sf project retrieve start -o MyTP  -x .\PackageXMLProject\package.xml -r .\PackageXMLProject\
```

#### Retrieve a specific component
```
sf project retrieve start --metadata CustomObject:NameOfObject
```

#### Deploy metadata from a specific package.xml in the subfolder
```
sf project deploy start -a 58.0 --source-dir .\PackageXMLProject\
```
use -a for the scratch org, or -o for an org

#### Create a scratch org
```
sf org create scratch --target-dev-hub MyHub --duration-days 3 -e=enterprise
```
Use e=enterprise or develop

#### Open the scratch org
```
sf org open --target-org MyGroovyScratchOrg
```

#### Create managed package in a specified folder
```
sf package create --name MyManagedPackage --description "Your Package Descripton" --package-type Managed --path PackageXMLProject --target-dev-hub devhub@example.com
```

Attention: do not specify the namespace for custom metadata object and the corresponding records, or it won't be included in the package!

#### Create version for managed package
```
sf package version create --package "Package Name" --installation-key “123456789” --wait 10
```

#### Install package version
```
sf package package install --package "package-version" --target-org username@org.com --installation-key “123456789” --wait 10
```

#### Get authorization URL for deployment
sf org display --verbose
sf org display --verbose --json > authFile.json

