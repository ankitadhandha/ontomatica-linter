# Structured Data Linter
Extract and validate embedded RDF markup in HTML and other formats.

## DESCRIPTION
The Structured Data Linter digests structured data, in the form of HTML marked-up
with [RDFa][], [JSON-LD][], or [Microdata][], or other RDF technologies supported in
[Linked Data][linkeddata].

The linter is part of the [structured-data.org](http://structured-data.org/),
and runs at [linter.structured-data.org](http://linter.structured-data.org/)

* Includes [N-Triples][] support using [RDF.rb][].
* Includes [RDF/XML][] support using the [RDF::RDFXML][] gem.
* Includes [Turtle][] and [Notation3][] support using the [RDF::N3][] gem.
* Includes [RDFa][] support using the [RDF::RDFa][] gem.
* Includes [RDF/JSON][] support using the [RDF::JSON][] gem.
* Includes [TriX][] support using the [RDF::TriX][] gem.
* Includes [Microdata][] support using the [RDF::Microdata][] gem.
* Includes [JSON-LD][] support using the [JSON::LD][] gem.

Output is expressed as HTML+RDFa in a _Snippet_ format.

### Running locally
To run locally, do a `bundle install` to load required dependencies. Then run with `foreman` or `rackup`:

    foreman start

or

    rackup

### Schema.org examples
To update the examples from schema.org, run `rake schema:examples`. Warnings for these examples can be generated into {file:etc/schema-warnings.txt} by running `rake schema:warnings`; remember to run `bundle install` first.

### Code layout
This application is represented as a [Sinatra][] application implemented in [Ruby][].

    assets                -- Assets for web application
    config.ru             -- [Rack][] configuration file, to start application
    lib
      rdf
        linter
          parser.rb         -- Parse and transform input to RDFa.
          rdfa_template.rb  -- RDFa output templates in [Haml][]
          snippets          -- Snippet templates
          views             -- Templates for view generation in [Erubis][]
          writer.rb         -- Sub-class of [RDFa][] writer for generating snippet output.
        linter.rb         -- Controller defining HTTP endpoints
    spec                  -- Tests

## Dependencies
* [Haml](http://rubygems.org/gems/haml) (>= 4.0.0)
* [Erubis](http://rubygems.org/gems/erubis) (>= 2.7)
* [RDF.rb](http://rubygems.org/gems/rdf) (>= 1.0)
* [Linked Data](http://rubygems.org/gems/linkeddata) (>= 1.0)
* [Linked Data for Rack](http://rubygems.org/gems/rack-linkeddata) (>= 1.0)
* [Linked Data for Sinatra](http://rubygems.org/gems/sinatra-linkeddata) (>= 1.0)
* [Nokogiri](http://rubygems.org/gems/nokogiri) (>= 1.5.9)
* [RDF::JSON](http://rubygems.org/gems/rdf-json) (>= 1.0)
* [RDF::Microdata](http://rubygems.org/gems/rdf-microdata) (>= 1.0)
* [RDF::N3](http://rubygems.org/gems/rdf-n3) (>= 1.0)
* [RDF::RDFa](http://rubygems.org/gems/rdf-rdfa) (>= 1.0)
* [RDF::RDFXML](http://rubygems.org/gems/rdf-rdfxml) (>= 1.0)
* [RDF::TriX](http://rubygems.org/gems/rdf-trix) (>= 1.0)
* [JSON::LD](http://rubygems.org/gems/json-ld) (>= 1.0)

## AUTHORS
* [Gregg Kellogg](http://github.com/ruby-rdf) - <http://kellogg-assoc.com/>
* Stéphane Corlosquet

## Setup notes
* public/.htaccess
* Bundle installed using:

    bundle install --path vendor/bundler

* Start the server with:

    bundle exec shotgun -p 3000 config.ru

## FEEDBACK

* http://groups.google.com/group/structured-data-dev
* https://github.com/structured-data/linter/issues

## Contributing
* Do your best to adhere to the existing coding conventions and idioms.
* Don't use hard tabs, and don't leave trailing whitespace on any line.
* Do document every method you add using [YARD][] annotations. Read the
  [tutorial][YARD-GS] or just look at the existing code for examples.
* Don't touch the `.gemspec`, `VERSION` or `AUTHORS` files. If you need to
  change them, do so on your private branch only.
* Do feel free to add yourself to the `CREDITS` file and the corresponding
  list in the the `README`. Alphabetical order applies.
* Do note that in order for us to merge any non-trivial changes (as a rule
  of thumb, additions larger than about 15 lines of code), we need an
  explicit [public domain dedication][PDD] on record from you.

## License
This is free and unencumbered public domain software. For more information,
see <http://unlicense.org/> or the accompanying {file:UNLICENSE} file.

[JSON-LD]:        http://www.w3.org/TR/2013/CR-json-ld-20130910/
[Microdata]:      http://www.w3.org/TR/microdata-rdf/
[N-Triples]:      http://en.wikipedia.org/wiki/N-Triples
[Notation3]:      http://en.wikipedia.org/wiki/Notation3
[RDF/JSON]:       http://n2.talis.com/wiki/RDF_JSON_Specification
[RDF/XML]:        http://www.w3.org/TR/rdf-syntax-grammar/
[RDFa]:           http://en.wikipedia.org/wiki/RDFa
[TriX]:           http://en.wikipedia.org/wiki/TriX_(syntax)
[Turtle]:         http://en.wikipedia.org/wiki/Turtle_(syntax)
[Sinatra]:        http://www.sinatrarb.com/
[Ruby]:           http://www.ruby-lang.org/en/
[RDF.rb]:         http://rubygems.org/gems/rdf
[Linked Data]:    http://rubygems.org/gems/linkeddata
[RDF::Microdata]: http://rubygems.org/gems/rdf-microdata
[RDF::N3]:        http://rubygems.org/gems/rdf-n3
[RDF::RDFa]:      http://rubygems.org/gems/rdf-rdfa
[RDF::RDFXML]:    http://rubygems.org/gems/rdf-rdfxml
[RDF::TriX]:      http://rubygems.org/gems/rdf-trix
[JSON::LD]:       http://rubygems.org/gems/json-ld
[Haml]:           http://haml-lang.com/
[Erubis]:         http://www.kuwata-lab.com/erubis/
[Rack]:           https://github.com/rack/rack/wiki# ontomatica-linter
