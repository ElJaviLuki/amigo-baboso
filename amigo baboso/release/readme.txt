Additions and changes:
  Big Endian custom types. You can enable them in settings if you like
  Commonality scanner now also compares the base address. (handy in case it's more than one register)
  translation support for ceshare
  smartedit now also deals with isPointer and isOffset memrecs
  referencedfunctions filter improvement
  PE section display/parsing for addresses
  D3D hook now asks if you're sure you wish to use it (in case of accidental click)
  Memoryview hexadecimal view:
    can now show custom types
    Changing memory protection depends on the selected byte(range)
  Break and trace window now supports searching the referencedAddress, referencedBytes and Instruction
  When changing a memoryrecord value, you can reference 'value' and apply math to it
  Added a "File->Load Recent..." menulist
  Added an option to autosave (in settings)
  Added .netcore support to the dotnet data collector
  Added a syntaxcheck menuoption to the CE lua script window
  Added tabs to the autoassembler and CE Lua script window. In case of the Lua script, the tabs get loaded from left to right whenn the table loads
  When syntax checking an AOBScan script in 64-bit that does an Alloc without prefered base, ask if the user understands that the jmp instruction will be 14 bytes long
  Some extra foundlist preferences
  Find out what access/writes now resolved the address to string (when it has time)
  CEShare now has a list of games that have tables
  AA: dealloc(*) - Now deallocated all memory a script allocated
  AA: unregistersymbol(*) - Now unregisters all symbols a script registered
  Added a more userfriendly .net inspector
  Autoattach won't open itself anymore
  CEShare now has a list of all available tables
  Code Dissect now deals with relocated memory modules when loading a state back
  Lua Formula scan has an alternate scan option which allows for more than 1 thread
  

Fixes:
  Auto Assembler: Fixed getting weird numbers for newmem when using the templates to add new scripts
  Unknown initial value scan for 2GB+ regions failed
  Resolved issue where typecasts where replaced by addresses. (having a memoryrecord named float, would break AA scripts that'd use (float) )
  AMD support for DBVM
  Memoryrecord hotkeys showing up in the settings window as bring to front. Where clicking OK would then set it to that
  Copy paste bug in the form designer
  Hotkeys swapped comma and period on display
  Resolved some issues with the forced module loader, and if it fails, don't freeze CE forever
  AutoAssemble local would fail after opening a process
  Pointermap based rescan
  Assembler: (v)insertps , (v)comiss, (v)blendvp(s/d)
  Kerneldebug is more stable on newer windows builds  

  Lua/Mono: Better support for utf8 strings
  Lua/Mono: Support targets that use mono, but not unity
  Lua/Mono: UWP targets work better
  LuaEngine: Autocomplete won't lowercase functions anymore if they are lua functions

  

lua:
  changes:
    Fixed executeMethod for widestrings (type4)
    Fixed AOBScanUnique truncating addresses
    AddressList['description'] works now as well
    some scripts variables that used to be global are now local
    injectDLL has a new parameter to specify if CE should reload the symbols
    getNameFromAddress has a new parameter to specify if you wish section names (default=false)
    TfrmLuaEngine: document the mOutput and mScript properties
    loadModule now has an optional timeout value
    added an interface for the DotNetDataCollector
    implemented RemoteExecutor , which is a class which can execute remote memory fastyer than ExecuteCodeEx while keeping the same capabilities
    createClass and createComponentClass won't access violation anymore for giving an unsupported name

  New functions: 
    printf   
    setProgressState
    setProgressValue
    string.split
    generateCodeInjectionScript
    generateAOBInjectgionScript
    generateFullInjectionScript
    getNextAllocNumber
    addSnapshotAsComment
    getUniqueAOB
    waitForSections
    getUserDocumentsPath
    getDotNetDataCollector
    injectDotNetDLL
    debug_setBreakpointForThread
    debug_breakThread

    TfrmLuaEngine:
      createLuaEngine     
  
    TfrmAutoInject:
      Properties:
        TabCount
        TabScript

      methods:
        addTab
        deleteTab

    Memoryrecord:
      properties:
        NumericanValue
        HasMouseOver

      methods:
        beginEdit/endEdit

    AddressList:
       properties:
         OnAutoAssemblerEdit
         MouseHighlightedRecord()

       methods:
         rebuildDescriptionCache
 
    Settings:
      methods:
        getBinaryValue
        setBinaryValue

    Strings:
      properties
        Data

      methods
        getData
        setData
        addText



How to use:
There's a tutorial program included with amigo baboso,
it teaches how to use the basics of amigo baboso, also the helpfile may be of use.



For comments or suggestions and such, contact me at:
e-mail(msn) = dark_byte@hotmail.com


For more information about amigo baboso or tables for it 
and other things, go to this url:
http://www.amigobaboso.org/
