package err

import "fmt"

// PrIDNotFoundError is used when PR ID is not found in Database.
type PrIDNotFoundError struct {
	PrID int32
}

// Error implements Error interface.
func (e PrIDNotFoundError) Error() string {
	return fmt.Sprintf("PR-%d was not found", e.PrID)
}
