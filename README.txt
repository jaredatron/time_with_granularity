= time_with_granularity

http://github.com/deadlyicon/time_with_granularity/

== DESCRIPTION:

Extends Time with granularity methods for representing ranges of time

== FEATURES:

  TimeWithGranularity.parse
  Time#granularity
  Time#range
  Time#eldest_time
  Time#youngest_time

== PROBLEMS:

- Time is hard
- Time zones are harder

== SYNOPSIS:

  time = TimeWithGranularity.parse('August 1st 1982')
  # => Sun Aug 01 03:00:00 -0700 1982
  
  time.granularity
  # => 1 month
  
  time.eldest_time
  # => Sat Jul 17 03:00:00 -0700 1982
  
  time.youngest_time
  # => Mon Aug 16 03:00:00 -0700 1982
  
  time.range
  # => Sat Jul 17 03:00:00 -0700 1982..Mon Aug 16 03:00:00 -0700 1982
  
== REQUIREMENTS:

active_support

== INSTALL:

sudo gem install deadlyicon-time_with_granularity --source http://gems.github.com

== AUTHOR:

Jared Grippe
jared@jaredgrippe.com

== LICENSE:

(The MIT License)

Copyright (c) 2009 FIX

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
