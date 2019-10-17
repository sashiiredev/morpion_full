require 'bundler'
Bundler.require

 $:.unshift File.expand_path('./../lib/app', __FILE__)

require 'board'
require 'game'
require 'boardcase'
require 'player'


 Game.new