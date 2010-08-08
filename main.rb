#!/usr/bin/env jruby
# main.rb
require 'java'

java_import 'java.awt.Component'
java_import 'javax.swing.JOptionPane'
java_import 'javax.swing.SwingUtilities'
java_import 'TestJavaClient.SampleFrame'

class Main
  java_signature 'void main(String[])'
  def self.main(args)
    sample_frame = SampleFrame.new
    sample_frame.set_visible(true)
  end

  java_signature 'void inform( final Component parent, final String str)'
  def self.inform(parent, str)
    if SwingUtilities.event_dispatch_thread?
      show_msg parent, str, JOptionPane::INFORMATION_MESSAGE
    else
      SwingUtilities.invoke_later {
        show_msg parent, str, JOptionPane.INFORMATION_MESSAGE
      }
    end
  end

end

