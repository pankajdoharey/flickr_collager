#Flickr Collager

## Flickr image search and Collage Creator.


## To build
There is a rakefile for all the tests, the list of all Rake tasks available can be
seen by :

```rake -T```

Also the project can be made into a gem

by doing a ```bundle``` and then building the gem by executing ```gem build flickr_collager.gemspec```

Once the gem in built it can be installed by :

```gem install flickr_collager-0.0.1.gem```

## Prerequisites : 

Before Installing the gem make sure Imagemagick is installed.

```brew install imagemagick```

Once the gem is installed into installs a executable called ```collage``` which can used as follows :

## Usage :

```collage -w pen,pencil,rose,women,brizil,everest,sunshine --out-file collage.png```

The project compensates for missing search terms if less than 10 from a dictionary.
