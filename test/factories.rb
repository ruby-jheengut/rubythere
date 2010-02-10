Factory.define :event do |f|
  f.name          "A Ruby Conference"
  f.url           "http://www.conf.com"
  f.start_date    "2009-08-01"
  f.end_date      "2009-08-05"
  f.description   "About text..."
  f.currency      "&pound;"
  f.cost          "195"
  f.association   :location
  f.association   :venue
end

Factory.define :location do |f|
  f.city          "Glasgow"
  f.country       "UK"
end

Factory.define :venue do |f|
  f.name         "A big hall"
  f.association  :location
end