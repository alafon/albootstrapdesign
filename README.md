# AL Bootstrap Design

## IMPORTANT

Most of the needed templates are still in an extension dedicated to my website
because they are too much customised. Refactoring is still being done.

## What is it ?

A simple [eZ Publish](http://share.ez.no) extension where Bootstrap has been
cloned into. Bootstrap can be found in lib/bootstrap as a submodule of this
git repository.

## Usage

* Clone this repository into your extension directory.
* Get submodules with `git submodule init && git submodule update`
* Enable the extension
* Modify your site.ini.append.php file (where needed) and add the designs you want to use to the AdditionalSiteDesignList array

```
AdditionalSiteDesignList[]
AdditionalSiteDesignList[]=bootstrap4ezcomments
AdditionalSiteDesignList[]=bootstrap4ezflow
AdditionalSiteDesignList[]=bootstrap4ezwebin
AdditionalSiteDesignList[]=bootstrap
```
* Clear your cache

## Want to contribute ?

Please create dedicated design (bootstrap4ezflow for instance) if you want to
override a design that is already overriding the default one. We need to do this
since multiple extension can override the same design for the same templates
(standard is overridden by eZ Flow AND eZ Webin for a lot of templates)

Create a branch for each of your pull requests. This branch has to be created
FROM your master branch. If not, there will be some side effects and I don't
want to waste my time cherry picking a commit within a branch that has hundreds
of commits ;)
Simply remember to do `git checkout master && git checkout -b your_branch`

You can rebase your master once your pull request has been merged.

If you need a working branch that has some modifications that I have not yet
merged. Create a branch named 'mine' and merge temporary branches in that one.

## What's next ?

* Include Less support (maybe with eZ Less)
* Add support for the upcoming v2 of Bootstrap

## What is Bootstrap ?

Bootstrap is a toolkit from Twitter design to kickstart development
of webapps and sites. It includes base CSS and HTML for typography,
forms, buttons, tables, grids, navigation, and more.

Bootstrap is tested and supported in major modern browsers like
Chrome, Safari, Internet Explorer, and Firefox.

Read more [here](http://twitter.github.com/bootstrap)

