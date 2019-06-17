extends RichTextLabel
func _ready():
    connect("meta_clicked", self, "meta_clicked");
func meta_clicked(meta):
    OS.shell_open("https://allespro.github.io");