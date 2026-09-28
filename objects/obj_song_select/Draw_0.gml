draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(1);
draw_set_color(c_white);


// TITLE
draw_text(
    640,
    80,
    "SONG SELECT"
);


// SONG BUTTONS
// SONG BUTTONS
// SONG BUTTONS
// SONG BUTTONS
// SONG BUTTONS
// SONG BUTTONS// SONG BUTTONS
// SONG BUTTONS

var visible_songs = 5;

// calc top song
if (selected_song != -1)
{
    scroll_offset = selected_song - 2;

    // Don't scroll past the beginning
    if (scroll_offset < 0)
    {
        scroll_offset = 0;
    }

    // nor the end
    if (scroll_offset > song_count - visible_songs)
    {
        scroll_offset = max(0, song_count - visible_songs);
    }
}


// Draw songs
for (var i = 0; i < song_count; i++)
{
    // Position relative to the scrolling list
    var list_position = i - scroll_offset;

    // Don't draw songs outside the visible area
    if (list_position < 0 || list_position >= visible_songs)
    {
        continue;
    }


    var selected = (i == selected_song);

    var scale = selected ? 1.0 : 0.82;

    var button_x = selected ? 660 : 640;
    var button_y = 150 + list_position * 100;

    var alpha = selected ? 1.0 : 0.45;

    var width = 500 * scale;
    var height = 80 * scale;


    // Transparency
    draw_set_alpha(alpha);


    // Button
    draw_set_color(c_black);

    draw_rectangle(
        button_x - width / 2,
        button_y - height / 2,
        button_x + width / 2,
        button_y + height / 2,
        false
    );


    // Selected outline
    if (selected)
    {
        draw_set_color(c_white);

        draw_rectangle(
            button_x - width / 2 - 4,
            button_y - height / 2 - 4,
            button_x + width / 2 + 4,
            button_y + height / 2 + 4,
            true
        );
    }


    // Song name
    draw_set_color(c_white);

    draw_text(
        button_x,
        button_y - 10,
        songs[i][0]
    );


    // Artist
    draw_set_alpha(alpha * 0.7);

    draw_text(
        button_x,
        button_y + 15,
        songs[i][1]
    );
}


// SONG INFO
// Only draw this if a song is selected

if (selected_song != -1)
{
    var info_x = 200;
    var info_y = 360;

    draw_set_alpha(1);
    draw_set_color(c_white);

    draw_text(
        info_x,
        info_y,
        "BPM  " + string(songs[selected_song][5])
    );

    draw_text(
        info_x,
        info_y + 35,
        "LENGTH  " + songs[selected_song][6]
    );

    var difficulty = songs[selected_song][7];

    var stars = "";

    for (var s = 0; s < 5; s++)
    {
        if (s < difficulty)
        {
            stars += "*";
        }
        else
        {
            stars += "-";
        }
    }

    draw_text(
        info_x,
        info_y + 70,
        "DIFFICULTY  " + stars
    );


    // COVER ART

    var cover_sprite = songs[selected_song][4];

    draw_set_alpha(1);

    var bob = sin(current_time / 400) * 5;

    draw_sprite_ext(
        cover_sprite,
        0,
        1100,
        350 + bob,
        1.2,
        1.2,
        0,
        c_white,
        1
    );
}


// Instructions

draw_set_alpha(1);
draw_set_color(c_white);

draw_text(
    640,
    650,
    "W / S  SELECT     ENTER  PLAY     ESC  BACK"
);