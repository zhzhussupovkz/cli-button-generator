#!/usr/bin/env ruby
# encoding: utf-8

=begin
/*

The MIT License (MIT)

Copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
=end

require "optparse"
require_relative "dabuttonfactory_api"

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Command-line tool for create button by https://www.dabuttonfactory.com.\n"
  opts.banner += "Copyright (c) 2014 Zhussupov Zhassulan zhzhussupovkz@gmail.com.\n"
  opts.banner += "Usage: start.rb [options]"

  opts.on('-h', '--help', "show this help page") do
    puts opts
    exit
  end

  opts.on('-t', '--text TEXT', "Text of the button") do |e|
    options[:t] = e
  end

  opts.on('-f', '--font FONT', "Text font: sans-serif, serif, monospace,
                                     DejaVuCondensed, Calibri, Caviar,
                                     Walkway, Burlington, Candela,
                                     SF_Arch_Rival, Komika\n\n") do |e|
    options[:f] = e
  end

  opts.on('--text-color COLOR', "Color of the text") do |e|
    options[:tc] = e
  end

  opts.on('--text-size SIZE', "Size of the text") do |e|
    options[:ts] = e
  end

  opts.on('--text-shs SIZE', "Space between the text and its shadow") do |e|
    options[:tshs] = e
  end

  opts.on('--text-shc COLOR', "Color of the shadow") do |e|
    options[:tshc] = e
  end

  opts.on('--corners SIZE', "Radius of the button corners") do |e|
    options[:c] = e
  end

  opts.on('--bg-type TYPE', "Radius of the button corners: unicolored, two-colors, gradient, pyramid") do |e|
    options[:bgt] = e
  end

  opts.on('--bg-color COLOR', "Color of the whole background if unicolored, or the color of the top") do |e|
    options[:bgc] = e
  end

  opts.on('--end-bg-color COLOR', "Color of the bottom of the background if two-colors or gradient, or the central color if pyramid") do |e|
    options[:ebgc] = e
  end

  opts.on('--border-size SIZE', "Size of the border") do |e|
    options[:bs] = e
  end

  opts.on('--border-color COLOR', "Color of the border") do |e|
    options[:bc] = e
  end

  opts.on('--shadow-size SIZE', "Size of the button shadow") do |e|
    options[:shs] = e
  end

  opts.on('--shadow-color COLOR', "Color of the button shadow") do |e|
    options[:shc] = e
  end

  opts.on('--shadow-orient ORIENT', "Orientation of the button shadow: n for north, or s, south, w or e, a combination (e.g: nw)") do |e|
    options[:sho] = e
  end

  opts.on('--bubble-effect BOOLEAN', "Draw a shiny ellipse on top of the button") do |e|
    options[:be] = e
  end

  opts.on('--hpadding SIZE', "Space between the text and the button left/right extremities (not counting the border and/or shadow size)") do |e|
    options[:hp] = e
  end

  opts.on('--vpadding SIZE', "Space between the text and the button top/bottom extremities (not counting the border and/or shadow size)") do |e|
    options[:vp] = e
  end

  opts.on('-w', '--width SIZE', "Total width of the button. Overwrites hpadding") do |e|
    options[:w] = e
  end

  opts.on('-h', '--height SIZE', "Total height of the button. Overwrites vpadding") do |e|
    options[:h] = e
  end

  opts.on('--type FILETYPE', "Filetype of the generated image: png, gif, jpeg, ico") do |e|
    options[:it] = e
  end

end

optparse.parse!
if options.empty?
  p optparse
  exit
end

api = DabuttonfactoryApi.new
api.generate(params = options)