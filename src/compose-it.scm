(library (compose-it)
  (export make-left left? left-value make-right right? right-value
	  either-flatmap either-map)
  (import (compose-it either)
	  (compose-it function)
	  (compose-it list)))
