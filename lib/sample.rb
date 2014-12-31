class Hny2015
  def message
    x = (get_cols / 2 ).to_i - 3
    y = (get_lines / 2 ).to_i 
    printf("\x1b[%d;%dH" , y,x)
    ary_henkan = []
    ary_henkan.push({"u"=>"あけまして"})
    ary_henkan.push({"u"=>"あけましておめでとうございなす"})
    ary_henkan.push({"u"=>"あけましておめでとうござい"})
    ary_henkan.push({"u"=>"あけましておめでとうございます。"})
    ary_henkan.push({"r"=>"明けまして","u"=>"おめでとうございます。"})
    ary_henkan.push({"n"=>"明けましておめでとうございます。"})
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

    x = (get_cols / 2 ).to_i - 3
    y = (get_lines / 2 ).to_i
    printf("\x1b[%d;%dH" , y,x)
    ary_henkan = []
    ary_henkan.push({"u"=>"ROOTERは"})
    ary_henkan.push({"u"=>"ROOTERはことしも"})
    ary_henkan.push({"u"=>"ROOTERは", "r"=>"今年も"})
    ary_henkan.push({"u"=>"ROOTERは今年もがんばります！"})
    ary_henkan.push({"u"=>"ROOTERは今年もがんばります！\u{1F411}"})
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

  def animation(num=2015)
    printf("\e[?25l");  #カーソルを隠す
    1.upto(num).each {|count|
      jump_sheep(count)
    }
  end

  def play
    message
    sleep 2
    animation
  end

  private
    def get_cols
      return `tput cols`.to_i
    end

    def get_lines
      return `tput lines`.to_i
    end

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
end

hny = Hny2015.new
hny.play
