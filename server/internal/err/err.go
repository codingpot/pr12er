package err

import "fmt"

// ErrorPrIDNotFound is used when PR ID is not found in Database.
type ErrorPrIDNotFound struct {
	PrID int32
}

// Error implements Error interface.
func (e ErrorPrIDNotFound) Error() string {
	return fmt.Sprintf("PR-%d was not found", e.PrID)
}
