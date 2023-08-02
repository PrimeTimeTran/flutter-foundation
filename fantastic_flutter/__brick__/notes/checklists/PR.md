# PR Checklist

## Fix formatting
dart fix --apply

## Generate freezed models
dart run build_runner build

## Generate translations
python3 ./scripts/translate.py

## PR

- [ ] Tested web
- [ ] Tested mobile
- [ ] Ran tests local
- [ ] Ran analyze local
- [ ] Created screen shots, gifs, video
- [ ] Wrapped API calls with try & catch
- [ ] Created loading, complete, failed states for API calls
