echo $(ls | sed 's/\(\.fig\|\.eps\)//' | sed 's/\-.*\.gif//g' | uniq | sed 's \(.*\) "\1" ')

