local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

	s("!t", {
		t({
			'#import "@preview/lovelace:0.3.0": no-number, pseudocode-list, with-line-label',
			"",
			"// update these headers",
			'#let sid = "550486709"',
			'#let assignment = "0"',
			"",
			"// page setup",
			"#set page(",
			'  paper: "a4",',
			"  margin: 2.5cm,",
			"  header: [",
			"    #grid(",
			"      columns: (1fr, 1fr, 1fr),",
			'      align(left)[#smallcaps[comp]#text(number-type: "old-style")[2823]],',
			"      align(center)[SID: #sid],",
			'      align(right)[#text(number-type: "old-style")[Assignment #assignment]],',
			"    )",
			"    #v(-5pt)",
			"    #line(length: 100%, stroke: 0.75pt)",
			"  ],",
			")",
			"",
			"// font setup",
			'#set text(font: "TeX Gyre Pagella", size: 13pt)',
			"#set par(",
			"  justify: true,",
			"  first-line-indent: 1.5em,",
			"  spacing: 0.85em,",
			")",
			"",
			"// part a) b) c)",
			"#let part(label, content) = pad(left: 1.5em)[",
			"  #grid(",
			"    columns: (1.5em, 1fr),",
			"    [#label], content,",
			"  )",
			"]",
			"",
			"// template for pseudo-code",
			"#let pseudocode(body) = block(",
			"  stroke: 0.7pt,",
			"  inset: 4pt,",
			"  radius: 2pt,",
			"  width: 100%,",
			")[",
			"  #pseudocode-list(",
			'    line-numbering: "1:",',
			"    indentation: 2em,",
			'    line-number-supplement: "",',
			"  )[#body]",
			"]",
			"",
			"// solution",
			"#let solution(num) = [*Solution #num.*]",
			"",
			"// Document body",
			"",
		}),
	}),
}
