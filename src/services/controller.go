package services





// ------------ UNIVERSAL ------------
// Page Info
type PageInfo struct {
	CurrentPage int `json:"currentPage"`
	TotalPage   int `json:"totalPage"`
	NextPage    int `json:"nextPage"`
	PrevPage    int `json:"prevPage"`
	TotalData   int `json:"totalData"`
}

// Response ALL DATA
type ResponseAll struct {
	Success  bool        `json:"success"`
	Message  string      `json:"message"`
	PageInfo PageInfo    `json:"pageInfo"`
	Results  interface{} `json:"results"`
}

type ResponseList struct {
	Success bool        `json:"success"`
	Message string      `json:"message"`
	Results interface{} `json:"results"`
}

// RESPONSE ERROR
type ResponseBack struct {
	Success bool   `json:"success"`
	Message string `json:"message"`
}

//Token
type TokenTemp struct {
	Token string `json:"token"`
}
