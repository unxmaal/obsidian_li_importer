# Overview

This adds data derived from a LinkedIn Connections export .csv to Obsidian markdown files named after the Connections.

# Usage


* Sanitize your data!
* Put your sanitized Connections.csv into this checkout directory.
* For safety, copy your Obsidian vault to ./outputs
* Edit li_connections.sh and confirm the output looks the way you want. 
* Run li_connections.sh
```
bash -x li_connections.sh
```
* Check several of the resulting files in outputs/ to confirm they aren't horribly mangled
* Edit li_connections.sh and change _outputdir= to your Obsidian Vault path. 
* Run li_connections.sh
```
bash -x li_connections.sh
```



# NOTICE!
You MUST sanitize your data!

The LI Connections .csv will have lots of disgusting cruft. The simple regex I've used doesn't handle commas outside the 6 standard fields. This means it'll break when it encounters vanity names, or fancy titles. 

For example:
```
John,Smith,,General Premium Poultry,Manager,2 Apr 2021
```

This will import cleanly, but

```
John,"Smith, PHD, MBA, WTF, OMG, BBQ",,General Premium Poultry,"Manager, DevOps Synergy, Virtual Emulation",2 Apr 2021
```

will not.