function ShowUrl(query)
    let split_query = split(a:query)
    let join_query = join(split_query, "+")
    
    let win_url = ":!start http://youtube.com/results?search_query=" . join_query
    let mac_url = ":!open http://youtube.com/results?search_query=" . join_query
    let others = "silent !sensible-browser" . join_query

    if has('win16') || has('win32') || has('win64')
        execute win_url
    elseif has('mac') || has('macunix') || has('gui_macvim')
        execute mac_url
    else
        execute others
    endif
endfunction

command! -nargs=1 UGo call ShowUrl(<f-args>)
