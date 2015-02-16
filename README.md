# shiki-colors-revival
This consists mostly of a script that modifies the original Zukitwo theme's
files to fit to all of the colors in the GNOME Colors palette.

At the moment, these themes are currently intended to be used with Xfce4, since
that's what I use. If you run into problems in another desktop environment,
I'll try to help the best I can though.

## Included
- GTK 2 and 3 themes
- Xfwm4 themes
- Openbox themes
- [Plank](https://launchpad.net/plank) themes

## Installing
1. Open a terminal in this repo's directory.
2. `./make-colors-themes generate`
3. `./make-colors-themes install` or `./make-colors-themes user-install`

Use `./make-colors-themes` if you want to know what else the installer can do.

## How this works
In order to minimize the amount of maintenance needed, we base these themes off
of [zuki-themes] so that we benefit from [lassekongo83]'s work on Zukitwo.
The themes are then generated by using regular expressions to replace certain
variables in the CSS to change the colors to fit the [GNOME Colors palette]
rather than using Zukitwo's default colors.

After replacing the colors, some patches are applied for some more complicated
patches; at the moment, we use a patch to enable a dark menubar theme, and to
add a panel background image.

As a result of doing it this method, we don't have to worry about updating the
CSS every time GNOME's developers decide to break everything with a new minor
version of GTK3, again. We can make upstream do all the work. :)

## Current problems
- Due to the way Zukitwo does GTK3's switch elements, they do not properly fit
  the different color themes. Zukitwo uses images for the switches, rather than
  pure CSS. Pull requests to fix this are welcomed, though.
- I'm still learning GTK, and GNOME developers, for some god-only-knows-why
  reason they decided to provide pretty awful documentation.
- Eventually this will stop working since GNOME developers will probably think
  that GTK 3 on non-GNOME environments is deprecated or something, and not worth
  their support. It's probably better to use Qt in the future.
- At the moment, the theme is (obviously) not a completely accurate recreation
  of Shiki-Colors-Murrine. It is not intended to really be a pixel-for-pixel
  remake of the theme; times have changed, and I like to think that so would
  the original theme if it were still being developed.

## Credits
- [zuki-themes] by [lassekongo83]
- [Shiki-Colors-Xfwm] by [fredbird67]
- Shiki-Colors-Openbox by [Arthur Spitzer]
    - also, note that I don't use Openbox so I can not really vouch for this. I
      will gladly accept any contributions by Openbox users concerning this
      theme, though.

[zuki-themes]: https://github.com/lassekongo83/zuki-themes
[Shiki-Colors-Xfwm]: http://xfce-look.org/content/show.php/Zukitwo-Colors+Xfwm+Themes?content=148624
[lassekongo83]: http://lassekongo83.deviantart.com/
[fredbird67]: http://xfce-look.org/usermanager/search.php?username=fredbird67
[Arthur Spitzer]: https://code.google.com/p/gnome-colors/issues/detail?id=75#c21
[GNOME Colors palette]: https://github.com/Somasis/gnome-colors-revival/blob/master/Palette.png