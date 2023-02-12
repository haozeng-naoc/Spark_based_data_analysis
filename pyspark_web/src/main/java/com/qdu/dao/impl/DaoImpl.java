/**
 @Author:LU80
 **/
package com.qdu.dao.impl;

import com.qdu.model.*;
import com.qdu.util.DatabaseUtil;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoImpl extends BaseDaoImpl {

    //1.各种语言支持数top10
    public List<language_count> select_language_count() {
        List<language_count> language_count = new ArrayList<language_count>();
        try {
            rs = exceuteQuery("select * from language_count");
            while (rs.next()) {
                language_count.add(new language_count(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return language_count;
    }
    //2.游戏类别
    public List<categories_count> select_categories_count() {
        List<categories_count> categories_count = new ArrayList<categories_count>();
        try {
            rs = exceuteQuery("select * from categories_count");
            while (rs.next()) {
                categories_count.add(new categories_count(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return categories_count;
    }
    //3.制作游戏最多的年份（新加列'year'）
    public List<years> select_years() {
        List<years> years = new ArrayList<years>();
        try {
            rs = exceuteQuery("select * from years");
            while (rs.next()) {
                years.add(new years(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return years;
    }
    //4.下载次数最多的游戏及其价格（新加列 'owners clean'）
    public List<most_downloaded_games_price> select_most_downloaded_games_price() {
        List<most_downloaded_games_price> most_downloaded_games_price = new ArrayList<most_downloaded_games_price>();
        try {
            rs = exceuteQuery("select * from most_downloaded_games_price");
            while (rs.next()) {
                most_downloaded_games_price.add(new most_downloaded_games_price(rs.getString(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return most_downloaded_games_price;
    }
    //5.游戏发行商top10(新加列 'owners clean')
    public List<top_publishers_total_downloads> select_top_publishers_total_downloads() {
        List<top_publishers_total_downloads> top_publishers_total_downloads = new ArrayList<top_publishers_total_downloads>();
        try {
            rs = exceuteQuery("select * from top_publishers_total_downloads");
            while (rs.next()) {
                top_publishers_total_downloads.add(new top_publishers_total_downloads(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return top_publishers_total_downloads;
    }
    //6.下载次数最多的游戏的好评和差评top10（新加列 'owners clean'）
    public List<Pos_neg> select_Pos_neg() {
        List<Pos_neg> Pos_neg = new ArrayList<Pos_neg>();
        try {
            rs = exceuteQuery("select * from Pos_neg");
            while (rs.next()) {
                Pos_neg.add(new Pos_neg(rs.getString(1), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return Pos_neg;
    }
    //7.好评率（好评数/评价总数）限制评价总数1000以上的游戏
    public List<rate_rank> select_rate_rank() {
        List<rate_rank> rate_rank = new ArrayList<rate_rank>();
        try {
            rs = exceuteQuery("select * from rate_rank");
            while (rs.next()) {
                rate_rank.add(new rate_rank(rs.getString(1), rs.getInt(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return rate_rank;
    }
    //8.Mac、Win、Linux中平均游戏价格
    public List<Average_price> select_Average_price() {
        List<Average_price> Average_price = new ArrayList<Average_price>();
        try {
            rs = exceuteQuery("select * from Average_price");
            while (rs.next()) {
                Average_price.add(new Average_price(rs.getDouble(1), rs.getDouble(2),rs.getDouble(3)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return Average_price;
    }
    //9.DLC数top5的开发者
    public List<top_dlc_developers> select_top_dlc_developers() {
        List<top_dlc_developers> top_dlc_developers = new ArrayList<top_dlc_developers>();
        try {
            rs = exceuteQuery("select * from top_dlc_developers");
            while (rs.next()) {
                top_dlc_developers.add(new top_dlc_developers(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return top_dlc_developers;
    }
    //10.有支持和无支持服务的游戏的平均玩家数
    public List<support> select_support() {
        List<support> support = new ArrayList<support>();
        try {
            rs = exceuteQuery("select * from support");
            while (rs.next()) {
                support.add(new support(rs.getString(1), rs.getString(2)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DatabaseUtil.close(rs, ps, con);
        }
        return support;
    }


}
