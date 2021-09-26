import urllib.request

for i in range(187,191):
    link_new = "https://dlib.phenikaa-uni.edu.vn/flowpaper/services/view.php?doc=154326530367638585459890020308435081303&format=jpg&page="+str(i)+"&subfolder=15/43/26/"
    name = "anh_"+str(i)+".jpg"
    urllib.request.urlretrieve(link_new,name)
    print('done ',name)
