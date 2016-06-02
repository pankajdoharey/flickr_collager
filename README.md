#Flickr Collager

## The following programming is related to Flickr Search in ruby using Commandline

There is a rakefile for all the tests, the list of all Rake tasks available can be
seen by :

```rake -T```

Also the project can be made into a gem

by doing a ```bundle``` and then building the gem by executing ```gem build flickr_collager.gemspec```

Once the gem in built it can be installed by :

```gem install flickr_collager-0.0.1.gem```

Before Installing the gem make sure Imagemagick is installed.

Once the gem is installed into installs a executable called ```collage``` which can used as follows :

### Example Usage :

```collage -w pen,pencil,rose,women,brizil,everest,sunshine --out-file collage.png```

The project compensates for missing search terms if less than 10 from a dictionary.
