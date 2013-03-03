ULI-XMLDIFF
===========

Our goal is to implement a tool which compares two xml files. The first
approach is to write a small wrapper around xmlunit.

For third-party products we use, please see the corresponding section towards the end of this document!

Cloning The GitHub Repo
-----------------------

To clone the GitHub repository of this project, it is probably best to
run `git clone https://github.com/uli-heller/uli-xmldiff.git --single-branch`.
This prevents you from downloading the "downloads" branch which contains all
the binaries created by this project.

Requirements
------------

To compile and use this project, you'll need

* Internet access to download various 3rd-party tools
    * XmlUnit
* Either JDK7 (preferred) or JDK6 installed and available via PATH

Project Structure
-----------------

* . ... the root folder
* bin ... various shell scripts
    * ant.sh ... wrapper for ant
    * groovy.sh ... wrapper for groovy
    * myjar.sh ... wrapper for JDK jar
    * prepare.sh ... downloads and unpacks the project dependencies
* build ... files generated when doing the compilation
    * classes ... compiled Java class files
* groovy-scripts ... various groovy scripts
* src ... various source files

Compile Project
---------------

### Compile Using A Preinstalled ANT

```sh
ant dist
```

### Compile Without A Preinstalled ANT

```sh
bin/ant.sh dist
```

GitHub
------

### Publish Project On GitHub

```sh
git remote add origin git@github.com:uli-heller/uli-xmldiff.git
git push -u origin master
```

### Store Build Artifacts On GitHub

```sh
$ git checkout master
$ git status
# On branch master
nothing to commit, working directory clean
$ git checkout --orphan downloads
$ git rm -rf .
$ jmacs README.txt # Enter description of the branch
$ git add README.txt
$ git commit -m "Created branch: downloads"
$ git push --set-upstream origin downloads
$ cp .../uli-xmldiff-0.1.bat .
$ cp .../uli-xmldiff-0.1.sh .
$ git add uli-xmldiff-0.1.bat uli-xmldiff-0.1.sh
$ git commit -m "Added downloads of version 0.1" .
$ git push # might take some time depending on your internet connection bandwidth
$ git checkout master # switch back to master
```

### Tags

#### Create A Tag Locally

```sh
git tag -a -m "Version 0.1" v0.1
```

#### Push To GitHub

```sh
git push --tags
```

#### Fetch From GitHub

```sh
git fetch --tags
```

Third Party Products And Tools
------------------------------

Here is a list of the 3rd party products and tools we are using for this project:

* [GitHub](http://github.com) ... for hosting the source code
* [Git](http://git-scm.org) ... for accessing hosted source code
* [Java](http://java.oracle.com) ... the programming language and execution environment we use
* [XmlUnit](http://xmlunit.sourceforge.net) ... the basis of this tool
* Linux, Bash, ...

Links And Notes
---------------

TBD
