package util

func StrArrContains(arr []string, item string) bool {
	for _, arrItem := range arr {
		if item == arrItem {
			return true
		}
	}

	return false
}
