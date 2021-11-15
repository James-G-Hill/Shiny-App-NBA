app <- ShinyDriver$new("../../")
app$snapshotInit("mytest")

# Sys.sleep(20)

app$setInputs(`sidebar-sidebar` = "tab_chart", allowInputNoBinding_ = TRUE)
app$setInputs(`sidebar-sidebar` = "tab_table", allowInputNoBinding_ = TRUE)
app$setInputs(`sidebar-sidebar` = "tab_help", allowInputNoBinding_ = TRUE)
app$setInputs(`sidebar-sidebar` = "tab_table", allowInputNoBinding_ = TRUE)
app$setInputs(`dashbody-tabitem_table-table_data` = "play")
app$snapshot()
