Pretty straightforward...

Gems listed in Gemfile, will install with $ bundle install (usual caveats concerning gem installation apply)

1) Add the domain(s) you want to check to domains.json.

2) $ ruby crawl.rb

3) Watch the output.

4) Open the generated CSV and analyze.

The default columns are page response time, HTTP status code, URL, and Lipsum detection (we all know it can slip into production occasionally).

This script is easily modified to include whatever you want.  Check the documentation for anemone (http://anemone.rubyforge.org/) or just "puts page.inspect" in the script to see the data available to you.

A note on the Lipsum Library: I've used the word list from the Drupal module Devel, because I that's usually how I generate Lipsum.  The lipsum checking is obviously fuzzy and imperfect.  Informational purposes only.

Future improvements:  Check for any references to staging domains, move configuration into a persistent site-specific structure (so tests can be readily saved and automatically run on a schedule), and add email alerts for serious (500) HTTP errors, empty content, or long response times.