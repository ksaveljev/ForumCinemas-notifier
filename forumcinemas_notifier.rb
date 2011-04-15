class ForumCinemasNotifier < Qt::Widget
  def initialize(parent = nil)
    super(parent)

    createActions
    createTrayIcon
    setIcon

    @trayIcon.show

    setWindowTitle(tr("ForumCinemas Notifier"))
  end

  private

  def createActions
    @quitAction = Qt::Action.new(tr("&Quit"), self)
    connect(@quitAction, SIGNAL(:triggered), $qApp, SLOT(:quit))
  end

  def createTrayIcon
    @trayIconMenu = Qt::Menu.new(self) do |menu|
      # menu.addSeparator
      menu.addAction(@quitAction)
    end

    @trayIcon = Qt::SystemTrayIcon.new(self)
    @trayIcon.contextMenu = @trayIconMenu
  end

  def setIcon
    icon = Qt::Icon.new(":/images/forumcinemas.ico")
    @trayIcon.icon = icon
    setWindowIcon(icon)
  end
end
