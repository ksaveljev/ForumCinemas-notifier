require 'Qt'
require './forumecinemas_widget.rb'

app = Qt::Application.new(ARGV)

unless Qt::SystemTrayIcon.isSystemTrayAvailable
  Qt::MessageBox.critical(nil, Qt::Object.tr("Systray"), Qt::Object.tr("Sorry, but system tray isn't available on this system."))
  exit 1
end

notifier = ForumCinemasNotifier.new
notifier.show

app.exec
