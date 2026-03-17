package gen

import (
	"crypto/rand"
	"math/big"
)

const (
	AlphaNum = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	Password = AlphaNum + `!"#$%()*+,-./:;<?@[]^_{|}~`
	Digits   = "0123456789"
)

func RandomString(length int, charset string) (string, error) {
	result := make([]byte, length)
	max := big.NewInt(int64(len(charset)))
	for i := range result {
		n, err := rand.Int(rand.Reader, max)
		if err != nil {
			return "", err
		}
		result[i] = charset[n.Int64()]
	}
	return string(result), nil
}
