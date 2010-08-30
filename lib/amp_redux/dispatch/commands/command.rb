##################################################################
#                  Licensing Information                         #
#                                                                #
#  The following code is licensed, as standalone code, under     #
#  the Ruby License, unless otherwise directed within the code.  #
#                                                                #
#  For information on the license of this code when distributed  #
#  with and used in conjunction with the other modules in the    #
#  Amp project, please see the root-level LICENSE file.          #
#                                                                #
#  © Michael J. Edgar and Ari Brown, 2009-2010                   #
#                                                                #
##################################################################

module Amp
  module Command
    # Creates a new command class and sets its name appropriately.
    def self.create(name)
      name[0,1] = name[0,1].upcase
      new_class = Class.new(Base)
      yield new_class
      self.const_set(name.to_s, new_class)
      new_class
    end
  end
end