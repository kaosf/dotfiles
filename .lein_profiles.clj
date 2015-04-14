{
  :user {
    :plugins [
      [lein-exec "0.3.1"]

      [lein-droid/lein-droid "0.2.0"]

      [lein-typed "0.3.1"]

      ; ref. https://github.com/weavejester/lein-auto
      ;[lein-auto "0.1.1"]

      ; ref. https://github.com/jakepearson/quickie
      ;[quickie "0.3.6"]

      ; ref.
      ;   http://dev.classmethod.jp/client-side/language-client-side/lein-autoexpect/
      ;   https://github.com/jakemcc/lein-autoexpect
      ;[lein-autoexpect "1.4.2"]

      ; For tmux status bar notification
      ; Now, I can do automated test by running "lein test-refresh" command.
      ; ref. http://www.stathis.co.uk/lein-test-refresh-notification-workflow/
      [com.jakemccrary/lein-test-refresh "0.5.0"]

      ; For colorizing on REPL
      ; ref.
      ;   https://github.com/venantius/ultra
      ;   https://github.com/venantius/ultra#installation
      [venantius/ultra "0.3.3"]
    ]
    ;:android {:sdk-path "/path/to/android-sdk/"}

    ; For tmux status bar notification
    ; ref. http://www.stathis.co.uk/lein-test-refresh-notification-workflow/
    :test-refresh {:notify-command ["tmux" "display-message"]
                   :notify-on-success true}

    ; ref. http://stackoverflow.com/questions/11598066/can-i-add-a-newline-to-the-clojure-repl-prompt
    ;:repl-options {:prompt #(str %1 "=>\n")}

    ; ref. https://github.com/venantius/ultra#installation
    :ultra {:color-scheme :solarized_dark}
  }
}
