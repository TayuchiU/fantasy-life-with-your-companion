extends Node

func sanitize_string(string:String) -> String:
    for c in string:
        if c in ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "+", "=", "[", "]", "{", "}"]:
            string = string.replace(c, "")
        if c == "_":
            string = string.replace(c, " ")
    string = string.capitalize().strip_edges()
    return string