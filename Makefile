final_timetable : Basic_color.cmo Infgraph.cmo Invertdict.cmo Kcoloring.cmo Timetable.cmo
	ocamlc -o final_timetable Basic_color.cmo Infgraph.cmo Invertdict.cmo Kcoloring.cmo Timetable.cmo

Invertdict.cmo : Invertdict.ml Invertdict.cmi
	ocamlc -c Invertdict.ml

Invertdict.cmi : Invertdict.mli
	ocamlc -c Invertdict.mli

Infgraph.cmo : Infgraph.ml Infgraph.cmi
	ocamlc -c Infgraph.ml

Infgraph.cmi : Infgraph.mli
	ocamlc -c Infgraph.mli

Basic_color.cmo : Basic_color.ml Basic_color.cmi
	ocamlc -c Basic_color.ml

Basic_color.cmi : Basic_color.mli Invertdict.cmi
	ocamlc -c Basic_color.mli

Kcoloring.cmo : Kcoloring.ml Kcoloring.cmi
	ocamlc -c Kcoloring.ml

Kcoloring.cmi : Kcoloring.mli
	ocamlc -c Kcoloring.mli

Timetable.cmo : Timetable.ml Timetable.cmi
	ocamlc -c Timetable.ml

Timetable.cmi : Timetable.mli Invertdict.cmi Basic_color.cmi Infgraph.cmi Kcoloring.cmi
	ocamlc -c Timetable.mli

clean :
	rm *.cmo *.cmi final_timetable
