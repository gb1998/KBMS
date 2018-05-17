/**
 * Created by warkey on 2018-04-24.
 */
public class Phone {
    private int id;
    private String name;
    private double price;
    private String brief;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String toString()
    {
        return "名字 "+name+" 描述 "+brief+" 价格 "+price;
    }
}
