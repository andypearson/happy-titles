# Releasing

These are steps for the maintainer to take to release a new version of this gem. Copied without mercy from [JacobEvelyn/friends](https://github.com/JacobEvelyn/friends).

1. On the `master` branch, update the `VERSION` constant in
`lib/happy-titles/version.rb`.
2. Commit the change (`git add -A && git commit -m 'Bump to vX.X.X'`).
3. Add a tag (`git tag -am "vX.X.X" vX.X.X`).
4. `git push && git push --tags`
5. `gem build happy-titles.gemspec && gem push *.gem && rm *.gem`
6. Celebrate!
