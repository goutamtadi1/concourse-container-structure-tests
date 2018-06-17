package main

import "encoding/json"

type Source struct {
	Repository         string          `json:"repository"`
	Tag                json.Number     `json:"tag"`
	Username           string          `json:"username"`
	Password           string          `json:"password"`
}

type Version struct {
	Digest string `json:"digest"`
}

type CheckRequest struct {
	Source  Source  `json:"source"`
	Version Version `json:"version"`
}

type CheckResponse []Version