class ProjectPdf<Prawn::Document

  def initialize(project, projectevents, todos, username)
    super(:page_layout => :portrait, :page_size => 'A4')
    image "#{Rails.root}/app/assets/images/rossixTeam-logo.jpg", :scale => 0.2
    @project = project
    @milestones = projectevents
    @todos = todos
    @username = username


  end

  def report

    move_down(20)
            font_size(18)
            text "Projekt: #{@project.title} ",
                 :style => :bold, :align => :center

    move_down(2)
    stroke do
      horizontal_rule
    end

            move_down(18)
            font_size(14)
            text "Projektstart:   #{@project.starts_at.strftime("%d.%m.%y")}" , :align => :center
            text "Projektende:    #{@project.ends_at.strftime("%d.%m.%y")}" , :align => :center
            text "verantwortlich: #{@username}" , :align => :center
            move_down(12)
            text "Beschreibung:" , :align => :center
             text " #{@project.description}" , :align => :center
    stroke do
          horizontal_rule
        end
    if @milestones != nil then

         items1 = [["Datum", "Milestone", "Beschreibung", "Status", "Verantwortlich"]] +
             @milestones.map do |item|
               [item.starts_at.strftime("%d.%m.%y"),
                item.title,
                item.description,
                item.state,
                item.user.name]
             end
         end
    move_down(18)
          font_size(18)
          text "Milestones:"
          move_down(1)
          font_size(12)

          if items1 != nil then


            table items1, :header => true,

                  :row_colors => ["FFFFFF", "DDDDDD"] do |t|
              t.row(0).font_style = :bold
              t.row(0).text_color = "FFFFFF"
              t.row(0).background_color = "535F55"

            end
          end
    move_down(18)
    stroke do
              horizontal_rule
    end
    move_down(18)

    if @todos != nil then

             items2 = [["Todo", "Beschreibung","Status", "Verantwortlich"]] +
                 @todos.map do |item|
                   [item.todotitle,
                    item.description,
                    item.state,
                    item.user.name]
                 end
             end
        move_down(18)
              font_size(18)
              text "Todos:"
              move_down(1)
              font_size(12)

              if items1 != nil then


                table items2, :header => true,

                      :row_colors => ["FFFFFF", "DDDDDD"] do |t|
                  t.row(0).font_style = :bold
                  t.row(0).text_color = "FFFFFF"
                  t.row(0).background_color = "535F55"

                end
            end
    start_new_page
    render
  end

end