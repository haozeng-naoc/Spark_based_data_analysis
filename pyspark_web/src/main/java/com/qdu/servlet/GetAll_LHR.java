package com.qdu.servlet;

import com.qdu.dao.impl.DaoImpl;
import com.qdu.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet({"/lhr"})
public class GetAll_LHR extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DaoImpl di=new DaoImpl();
        List<language_count> language_count= di.select_language_count();
        List<categories_count> categories_count=di.select_categories_count();
        List<years> years=di.select_years();
        List<most_downloaded_games_price> most_downloaded_games_price=di.select_most_downloaded_games_price();
        List<top_publishers_total_downloads> top_publishers_total_downloads=di.select_top_publishers_total_downloads();
        List<Pos_neg> Pos_neg=di.select_Pos_neg();
        List<rate_rank> rate_rank=di.select_rate_rank();
        List<Average_price> Average_price=di.select_Average_price();
        List<top_dlc_developers> top_dlc_developers=di.select_top_dlc_developers();
        List<support> support=di.select_support();

        req.setAttribute("language_count",language_count);
        req.setAttribute("categories_count",categories_count);
        req.setAttribute("years",years);
        req.setAttribute("most_downloaded_games_price",most_downloaded_games_price);
        req.setAttribute("top_publishers_total_downloads",top_publishers_total_downloads);
        req.setAttribute("Pos_neg",Pos_neg);
        req.setAttribute("rate_rank",rate_rank);
        req.setAttribute("Average_price",Average_price);
        req.setAttribute("top_dlc_developers",top_dlc_developers);
        req.setAttribute("support",support);

        req.getRequestDispatcher("/lhr.jsp").forward(req, resp);
    }
}
