#!/usr/bin/env jruby
# main.rb
require 'java'

include_class java.awt.Component
include_class javax.swing.JOptionPane
include_class javax.swing.SwingUtilities
include_class IncludeMe

class Main
  def main(args= nil)
    p self.methods - 1.methods
  end
  def  inform(parent, str)
    p self.methods - 1.methods
    if SwingUtilities.isEventDispatchThread()
      showMsg( parent, str, JOptionPane.INFORMATION_MESSAGE)
    else
      # do nothing
    end
  end
end

Main.new().main
