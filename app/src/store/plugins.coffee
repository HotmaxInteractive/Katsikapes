module.exports =

  init: (store)=>
    #screen resolution check
    mobile = 800
    desktop = 1280
    do widthCheck = ()=>
      WIDTH = window.innerWidth
      switch
        when (WIDTH <= mobile) then store.commit 'SET_PORT', 'mobile'
        when (WIDTH > mobile) and (WIDTH <= desktop) then store.commit 'SET_PORT', 'tablet'
        else store.commit 'SET_PORT', 'desktop'
    window.addEventListener 'resize', ()=>
      widthCheck()
