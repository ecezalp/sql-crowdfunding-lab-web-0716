def selects_the_titles_of_all_projects_and_their_pledge_amounts
  <<-SQL
    SELECT projects.title as project_title, SUM(pledges.amount) as total_pledge_amount 
    FROM projects 
    JOIN pledges
    ON projects.id = pledges.project_id
    GROUP BY projects.title;
  SQL
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
  <<-SQL
    SELECT users.name as user_name, users.age as users_age, SUM(pledges.amount) as total_pledge_amount 
    FROM users
    LEFT JOIN pledges
    ON users.id = pledges.user_id
    GROUP BY users.name;
  SQL

end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
<<-SQL
    SELECT projects.title as project_title, (SUM(pledges.amount) - projects.funding_goal) as amount_over_goal 
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
    GROUP BY projects.title
    HAVING SUM(pledges.amount) >= projects.funding_goal;

  SQL
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
<<-SQL
    SELECT users.name as user_name, SUM(pledges.amount) as total_amount
    FROM users
    JOIN pledges
    ON users.id = pledges.user_id
    GROUP BY users.name
    ORDER BY total_amount ASC;
  SQL

end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
<<-SQL
    SELECT projects.category, pledges.amount as total_amount
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
    WHERE projects.category = "music"; 
  SQL

end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
<<-SQL
    SELECT projects.category, SUM(pledges.amount) as total_amount
    FROM projects
    JOIN pledges
    ON projects.id = pledges.project_id
    WHERE projects.category = "books"
    GROUP BY projects.category; 
  SQL
end