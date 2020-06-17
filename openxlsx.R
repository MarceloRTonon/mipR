
var_ano <- paste0("MIP_", 2000:2009 ,"_42.xlsx")
wb <- map(var_ano, ~ loadWorkbook(.x))

walk2(wb, varList.exp.transp, function(x, y) map2( y, sheet.exp, function(w,z) writeData(x, sheet = z, w, colNames = F, startRow = 6, startCol = 3)))

walk2(wb, var_ano, ~ saveWorkbook(.x, .y, overwrite = T))