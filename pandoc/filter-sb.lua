--[[
 CDDL HEADER START

 The contents of this file are subject to the terms of the
 Common Development and Distribution License (the "License").
 You may not use this file except in compliance with the License.

 You can obtain a copy of the license at https://illumos.org/license/
 
 When distributing Covered Code, include this CDDL HEADER in each
 file and include the License file at https://illumos.org/license/
 If applicable, add the following below this CDDL HEADER, with the
 fields enclosed by brackets "[]" replaced with your own identifying
 information: Portions Copyright [yyyy] [name of copyright owner]

 CDDL HEADER END


 Copyright 2021 J. Madgwick.  All rights reserved.
--]]

if FORMAT:match 'latex' then
    documentTitle = ""

    -- Use the top Header (which is actually the title) as a LaTex title + TOC, reduce other 'Header' levels by one
    function Header(elem)
      if (elem.level == 1) then
        documentTitle = pandoc.utils.stringify(elem.content) -- Extract text as a string to use in the metadata
        table.insert(elem.content,1,pandoc.RawInline('latex', '\\pagenumbering{roman}\\title{'))
        table.insert(elem.content,pandoc.RawInline('latex', '}\\maketitle\\newpage\\renewcommand{\\contentsname}{Table of Contents}\\tableofcontents\\addtocontents{toc}{\\vspace{0.3cm}}\\newpage\\pagenumbering{arabic}'))
        return pandoc.Plain(elem.content)
      else
        elem.level = elem.level - 1
        if (elem.level == 1) then
          local fancyHeader = elem.content:clone()
          local fancyHeaderBlock = {}
          table.insert(fancyHeaderBlock,elem)
          table.insert(fancyHeader,1,pandoc.RawInline('latex', '\\mbox{}\\vspace{-1.5\\baselineskip}\\fancyhead[CEO]{'))--vbox requried due to parsing bug with fancyhead when titlesec not used
          table.insert(fancyHeader,pandoc.RawInline('latex', '}'))
          table.insert(fancyHeaderBlock,pandoc.Plain(fancyHeader))
          return fancyHeaderBlock
        else
          return elem
        end
      end
    end

    -- Set the PDF title metadata
    function Meta(m)
      m['title-meta'] = documentTitle
      return m
    end

    -- Correct header levels and indent all text within primary sections
    function Pandoc(thedoc)
      local blocks = thedoc.blocks
      local headers = {}
      for i = 1, #blocks, 1 do
        if (blocks[i].t == "Header" and blocks[i].level == 1) then
          table.insert(headers, i)
        end
      end
      local offset = 0
      beginOffset = pandoc.RawBlock('latex', "\\begin{adjustwidth}{5em}{0pt}")
      endOffset = pandoc.RawBlock('latex', "\\end{adjustwidth}\\newpage")
      for i = 1, #headers, 1 do
        if (i == 1) then
          table.insert(blocks,headers[i]+1,beginOffset)
          offset = 1
        else
          table.insert(blocks,headers[i]+offset,endOffset)
          table.insert(blocks,headers[i]+offset+2,beginOffset)
          offset = offset + 2
        end
      end
      table.insert(blocks,endOffset)

      -- Reformat and indent 'Note' and 'Caution' sections
      local i = 1
      local noteBegin = pandoc.RawBlock('latex', "\\begin{adjustwidth}{1.2em}{0pt}{\\Large \\textbf{Note}}")
      local cautionBegin = pandoc.RawBlock('latex', "\\begin{adjustwidth}{1.2em}{0pt}{\\Large \\textbf{Caution}}")
      local noteEnd = pandoc.RawBlock('latex', "\\end{adjustwidth}")
      while i <= #blocks do
        if (blocks[i].t == "Div" and (blocks[i].classes[1] == "note" or blocks[i].classes[1] == "info")) then
          table.insert(blocks[i].content,1,noteBegin)
          table.insert(blocks[i].content,noteEnd)
        elseif (blocks[i].t == "Div" and (blocks[i].classes[1] == "warning" or blocks[i].classes[1] == "caution")) then
          table.insert(blocks[i].content,1,cautionBegin)
          table.insert(blocks[i].content,noteEnd)
        end
        i = i + 1
      end
      return thedoc
    end
end
