(library (compose-it)
  (export make-left left? left-value make-right right? right-value
	  either-flatmap either-map compose curry flip foldr foldl flatmap
	  intersperse cartesian-product reject zip times take take-last drop
	  drop-last range)
  (import (compose-it either)
	  (compose-it function)
	  (compose-it list)))
