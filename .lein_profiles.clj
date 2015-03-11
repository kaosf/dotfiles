{
  :user {
    :plugins [
      [lein-exec "0.3.1"]
      [lein-droid/lein-droid "0.2.0"]
      [lein-typed "0.3.1"]
      ; ref. https://github.com/weavejester/lein-auto
      [lein-auto "0.1.1"]
      ; ref. https://github.com/jakepearson/quickie
      [quickie "0.3.6"]
      ; ref.
      ;   http://dev.classmethod.jp/client-side/language-client-side/lein-autoexpect/
      ;   https://github.com/jakemcc/lein-autoexpect
      [lein-autoexpect "1.4.2"]
    ]
    ;:android {:sdk-path "/path/to/android-sdk/"}

    ; ref. http://stackoverflow.com/questions/11598066/can-i-add-a-newline-to-the-clojure-repl-prompt
    ;:repl-options {:prompt #(str %1 "=>\n")}
  }
}
