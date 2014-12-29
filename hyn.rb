# http://www.serendip.ws/archives/4635
# http://7ujm.net/etc/esc.html
#print("\u{1F40F}\n"); #大きな羊
#print("\u{1F411}\n"); #小さな羊

def get_cols
  return `tput cols`.to_i
end

def get_lines
  return `tput lines`.to_i
end

def 練習
  puts "\e[H\e[2J"
  h_middle = (get_cols / 2).to_i
  v_middle = (get_lines / 2).to_i
  count = 0
  1.upto(15) do
    count += 1
    printf("\033[%d;%dH" ,v_middle,h_middle)
    if count.modulo(10)  == 0 
      print("\u{1F40F}\n"); #大きな羊
    else
      print("\u{1F411}\n"); #子羊    
    end
    sleep(1)
    h_middle += 2
    print("\a");
  end
end

#練習

def アニメの練習
  x = (get_cols).to_i
  y = (get_lines / 2).to_i
  1.upto(200) do
    puts "\e[H\e[2J" #毎回消す
    # x はちょっとずつ減らすことで上手から下手へ
    x -= 1
    if x == 0 
      break
    end
    #ときどきジャンプさせるために、y方向をずらす
    if x.modulo(10) == 0
      jump = -2
    elsif(x.modulo(10) == 9 || x.modulo(10) == 1)
      jump = -1
    else
      jump = 0
    end
    printf("\033[%d;%dH" , y+jump,x)
    print("\u{1F411}\n"); #子羊 
    sleep(0.1)
  end
end

#アニメの練習

def 変換のアニメーションをやってみる
  x = (get_cols / 2 ).to_i - 3
  y = (get_lines / 2 ).to_i 
  printf("\x1b[%d;%dH" , y,x)
  ary_henkan = []
  ary_henkan.push({"u"=>"あけまして"})
  ary_henkan.push({"u"=>"あけましておめでとうございなす"})
  ary_henkan.push({"u"=>"あけましておめでとうござい"})
  ary_henkan.push({"u"=>"あけましておめでとうございます"})
  ary_henkan.push({"r"=>"明けまして","u"=>"おめでとうございます"})
  ary_henkan.push({"n"=>"明けましておめでとうございます"})
  ary_henkan.each {|line|
    puts "\e[H\e[2J" #毎回消す
    line.each {|mode,value|
      print("\x1b[0m"); #元に戻す
      if mode == "u"
        print("\x1b[4m");  
      elsif mode == "r"
        print("\x1b[7m");
      end
      print value
    }
    sleep(0.5)
  }
  printf("\x1b[0m"); #元に戻す
  printf("\033[%d;%dH", get_lines,0) #カーソル位置も左下に
end

#変換のアニメーションをやってみる

def jump_sheep(sheep_count)
  x = get_cols.to_i
  y = (get_lines / 2).to_i
  back_x = 0
  printf("\x1b5h") #カーソルを消す
  1.upto(200) do
    puts "\e[H\e[2J" #毎回消す
    # x はちょっとずつ減らすことで上手から下手へ
    x -= 1
    if x == 0 
      break
    end
    #背景を移動させる
    if x.modulo(3) == 0
      back_x +=1
    end
    back_x = 0 if(back_x > get_cols)
    
    printf("\033[%d;%dH" , y - 1,back_x)
    printf("\u{1F333}" + "\n")

    #ときどきジャンプさせるために、y方向をずらす
    if x.modulo(10) == 0
      jump = -2
    elsif(x.modulo(10) == 9 || x.modulo(10) == 1)
      jump = -1
    else
      jump = 0
    end
    printf("\033[%d;%dH" , y+jump,x)
    print("\u{1F411} " * sheep_count + "\n"); #子羊 
    sleep(0.1)
  end
end

def 羊が複数
  1.upto(100).each {|count|
    jump_sheep(count)
  }
end

羊が複数